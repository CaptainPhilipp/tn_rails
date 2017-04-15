class CarriageValidateType < ActiveModel::Validator
  def validate(record)
    return true if Carriage::TYPES.include? type
    record.errors[:type] << "Type #{record.type} not exists"
  end
end
