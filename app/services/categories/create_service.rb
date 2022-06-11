module Categories
  class CreateService
    include Interactor

    delegate :name, to: :context

    def call
      category = Category.new(name: name)
      context.fail!(error: Error.record_invalid(category.errors)) unless category.save
      context.result = category
    end
  end
end
