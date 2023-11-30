class BaseService < Patterns::Service
  class_attribute :steps
  attr_reader :errors, :steps

  def self.steps(*steps)
    self.steps = steps
  end

  def initialize(*_args)
    @errors = []
    @failed = false
  end

  def call
    process_steps
  end

  def success?
    !@failed
  end

  def fail(*errors, stop: true)
    @errors ||= []
    @errors.push(*errors&.flatten)
    raise @errors.to_json if stop
  end

  private

  def process_steps
    self.class.steps.each do |step|
      method(step).call
    end
    nil
  rescue RuntimeError
    @failed = true
  end

end
