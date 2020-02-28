class DateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, 'を正確に入力してください') unless value <= Date.today
  end
end
