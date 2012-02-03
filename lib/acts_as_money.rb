require 'money'

class ActiveRecord::Base
  class << self
    def acts_as_money
      include(ActsAsMoney)
    end
  end
end


module ActsAsMoney #:nodoc:
  def self.included(base) #:nodoc:
    base.extend ClassMethods
  end

  module ClassMethods
    def money(name, options = {})
      mapping = [[(options[:cents] || :cents).to_s, 'cents']]
      mapping << [(options[:currency] || :currency).to_s, 'currency_as_string'] if options[:currency] != false
      composed_of name,  {
        :class_name => 'Money',
        :allow_nil => options[:allow_nil],
        :mapping => mapping,
        :constructor => Proc.new {|cents, currency| options[:allow_nil] && !cents ? nil : Money.new(cents || 0, currency || Money.default_currency)},
        :converter => Proc.new {  |value|
          case value
          when Fixnum
            Money.new(value, Money.default_currency)
          when Float
            Money.new((value * 100).to_d, Money.default_currency)
          when String
            Money.new((value.to_f * 100).to_d, Money.default_currency)
          else
            value
          end
    
        }
      }      
    end
  end
end



