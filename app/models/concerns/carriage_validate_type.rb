class CarriageValidateType < ActiveModel::Validator
  def validate(record)
    return true if Carriage::TYPES.include? record.type
    record.errors.add(:type, :existance, type: record.type)
  end
end
