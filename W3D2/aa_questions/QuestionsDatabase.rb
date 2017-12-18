require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
     super("questions.db")
     self.type_translation = true
     self.results_as_hash = true
  end
end

class ModelBase

  def self.find_by_id(id)
    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{self.to_s.downcase}s
      WHERE
        #{self.to_s.downcase} = ?
    SQL
    raise 'Record not found' if data.empty?
    self.new(data.first)
  end
require 'byebug'
  def self.where(opts)
    where_clause = ""

    opts.each do |k,v|
      where_clause += "#{k} = '#{v}'"
      where_clause += " AND "
    end

    where_clause = where_clause[0..-6]
    byebug
    data = QuestionsDatabase.instance.execute(<<-SQL, where_clause)
      SELECT
        *
      FROM
        #{self.to_s.downcase}s
      WHERE
        ?
    SQL

    raise 'Nothing found' if data.empty?
    data.map { |datum| self.new(datum) }
  end

end

class Question < ModelBase
  attr_accessor :id, :title, :body, :author

  def initialize(opts)
    @question = opts['question']
    @title =  opts['title']
    @body = opts['body']
    @author = opts['author']
  end

  def self.all
    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        questions
      SQL
    data.map{|col| Question.new(col)}
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
      SELECT
        *
      FROM
        questions
      WHERE
        author = ?
    SQL
    data.map { |datum| Question.new(datum) }

  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    QuestionLike.most_liked_questions(n)
  end

  def author
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE user = #{@author}")
    raise "author not found" if data.empty?
    User.new(data.first)
  end

  def replies
    Reply.find_by_question_id(@question)
  end

  def followers
    QuestionFollow.followers_for_question_id(@question)
  end


end
