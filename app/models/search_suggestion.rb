class SearchSuggestion < ActiveRecord::Base

  def self.terms_for(prefix)
    suggestions = where("term like ?", "#{prefix}_%")
    suggestions.order("popularity desc").limit(10).pluck(:term)
  end

  def self.index_employees
    Employee.find_each do |employee|
      index_term(employee.first_name)
      index_term(employee.last_name)
      # index_term(employee.other_names)
      # index_term(employee.emp_id)
      employee.first_name.split.each { |e| index_term(e) }
    end
  end

  def self.index_term(term)
    where(term: term).first_or_initialize.tap do |suggestion|
      suggestion.increment! :popularity
    end
  end
end
