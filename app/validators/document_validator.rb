class DocumentValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    document = value.gsub(/\D/, '')

    valid =
      if record.person?
        CPF.valid?(document)
      elsif record.company?
        CNPJ.valid?(document)
      else
        false
      end

    record.errors.add(attribute, "inválido para o tipo de pessoa selecionado") unless valid
  end
end