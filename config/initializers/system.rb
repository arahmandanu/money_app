Dry::Rails.container do
  config.component_dirs.add 'app/core'
end

CleanArchitecture::UseCases::AbstractUseCase.instance_eval do
  def self.contract(base_contract = CleanArchitecture::UseCases::Contract, &proc)
    @contract ||= Class.new(base_contract, &proc)
  end
end

CleanArchitecture::UseCases::Errors.class_eval do
  def full_messages
    @active_model_errors.messages.map do |attribute, messages|
      attribute_name = if attribute == CleanArchitecture::UseCases::Errors::BASE_NAME
                         nil
                       else
                         ActiveSupport::Inflector.humanize(attribute)
                       end
      messages.map { |message| [attribute_name, message].compact.join(' ') }
    end.flatten
  end
end
