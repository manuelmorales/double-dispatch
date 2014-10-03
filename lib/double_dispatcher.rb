class DoubleDispatcher
  def dispatch object
    processors[object].call object
  end

  def []= key, value
    processors[key]= value
  end

  private

  def initialize &block
    @default_proc = block
  end

  def processors
    @processors ||= build_processors_hash
  end

  def build_processors_hash
    hash = { Object => default_proc }
    hash.default_proc = method(:match_ancestry)
    hash
  end

  def match_ancestry hash, object
    object.class.ancestors.each do |ancestor|
      return processors[ancestor] if processors.has_key?(ancestor)
    end
  end

  def default_proc
    @default_proc ||= lambda{|o| o }
  end
end
