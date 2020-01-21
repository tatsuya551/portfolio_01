class DateValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)

    unless value <= Date.today
      record.errors.add(attribute, 'を正確に入力してください') 
    end

  end
end
