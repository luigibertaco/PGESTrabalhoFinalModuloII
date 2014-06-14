class HomeController < ApplicationController
	def index
	end
  
  def importabatidas
    @batidas ||= []
    batida = RestClient.get 'http://colchonet-teste-120972.sae1.nitrousbox.com:4000/registers/getfirst.json'
    @ret = JSON.parse(batida)
    while !@ret['id'].nil?
      b = Batida.new
      b.funcionario_id = @ret['funcionario']
      b.data = @ret['data']
      b.hora = @ret['hora']
      b.save
      
      @batidas.push @ret
      
      batida = RestClient.get 'http://colchonet-teste-120972.sae1.nitrousbox.com:4000/registers/getfirst.json'
      @ret = JSON.parse(batida)
    end
  end
end