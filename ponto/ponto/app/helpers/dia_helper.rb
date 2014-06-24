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
		funcionario.batidas.where(data: data).order('time(hora)').all
	end

	def dia_util?(funcionario, data)
		if feriado?(data)
			false
		elsif fim_de_semana?(data)
			false
		elsif ferias?(funcionario,data)
			false
		elsif primeira_batida(funcionario) > data
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
	    resto = total_dia(funcionario, data) - tempo_esperado(funcionario, data)
	    if resto <= 0 && resto >= -20.minutes
	    	resto = 0
	    end
	    resto
	end

	def saldo_total(funcionario, data)
		saldo_total = 0
		data_inicio = primeira_batida(funcionario).nil? ? data : primeira_batida(funcionario)
		(data_inicio..data).each do |d|
			saldo_total += saldo_dia(funcionario, d)
		end
		saldo_total
	end

	def hora_formatada(tempo)
		horas = (tempo.abs / 60 / 60).to_i.to_s.rjust(2, '0') 
		minutos = (tempo.abs / 60 % 60).to_i.to_s.rjust(2, '0')
	    formatado = "#{horas}:#{minutos}"
	    tempo >= 0.hours ? "#{formatado}" : "-#{formatado}"
	end
  
	def divergencia?(funcionario, data)
		saldo_dia(funcionario, data) != 0
	end

	def inconsistencia?(funcionario, data)
		batidas(funcionario, data).count != 4
	end

	def primeira_batida(funcionario)
		primeira_batida = funcionario.batidas.order(:data).select(:data).first
		primeira_batida.nil? ? Date.tomorrow : primeira_batida.data
	end
end