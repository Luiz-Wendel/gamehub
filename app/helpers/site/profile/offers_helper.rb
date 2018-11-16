module Site::Profile::OffersHelper
  OptionsForStatus = Struct.new(:id, :description) # Cria uma Struct

  def options_for_status
    Offer.status_i18n.map { |key, value| OptionsForStatus.new(key, value) }
      # Percorre todos os elementos do hash 'status_i18n' e pega a chave e o valor
      # Cria um objeto com os valores que foram pegos e joga no vetor:
      # [<Struct id: "full", description: "Total">, <Struct id: "restricted", description: "Restrito">]
  end
end
