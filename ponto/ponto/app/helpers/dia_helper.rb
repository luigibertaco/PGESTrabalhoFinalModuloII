module DiaHelper
	def classe_dia(funcionario, data)
		if ferias?(funcionario, data)
            'info' 
        elsif feriado?(data)
            'danger'
        elsif fim_de_semana?(data)
            'warning'
        end
	end

	def feriado?(data)
		Feriado.where(data: data).any? 
	end

	def fim_de_semana?(data)
		data.wday.in? [0,6]
	end

	def ferias?(funcionario, data)
		data.in? funcionario.todasferias 
	end

	def batidas_formatado(funcionario, data)
		batidas ||= []
		batidas(funcionario, data).each do |b|
			batidas.push(b.hora.strftime("%H:%M"))
		end
		batidas.to_s
	end

	def batidas(funcionario, data)
		funcionario.batidas.where(data: data).order(:hora).all
	end

	def dia_util?(funcionario, data)
		if feriado?(data)
			false
		elsif fim_de_semana?(data)
			false
		elsif ferias?(funcionario,data)
			false
		else
			true
		end
	end

	def tempo_esperado(funcionario, data)
		if dia_util?(funcionario, data) 
			8.hours.to_i
		else
			0
		end
	end

	def total_dia(funcionario, data)
		saldo = 0
		hora_entrada = nil
		batidas(funcionario, data).each do |b|
			if hora_entrada.nil?
				hora_entrada = b.hora
			else
				saldo += b.hora - hora_entrada
				hora_entrada = nil
			end
		end
		saldo
	end

	def saldo_dia(funcionario, data)
		tempo_esperado(funcionario, data) - total_dia(funcionario, data)
	end

	def saldo_total(funcionario, data)
		saldo_total = 0
		primeira_batida = funcionario.batidas.order(:data).select(:data).first
		data_inicio = primeira_batida.nil? ? data : primeira_batida.data
		(data_inicio..data).each do |d|
			saldo_total += saldo_dia(funcionario, d)
		end
		saldo_total
	end

	def hora_formatada(tempo)
		horas = ((tempo.to_i / 60) / 60).to_s.rjust(2, '0') 
		minutos = ((tempo / 60) % 60).to_i.to_s.rjust(2, '0')
		"#{horas}:#{minutos}"
	end
end