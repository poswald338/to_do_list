class TitleValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.start_with? 'D'
      record.errors.add :name, "Title must start with D!"
    end
  end
end