require_relative 'QuestionsDatabase.rb'
require_relative 'User.rb'

class Reply < ModelBase

  attr_accessor :subject_question, :parent_reply, :author_id, :body

  def initialize(opts)
    @reply = opts['reply']
    @subject_question = opts['subject_question']
    @parent_reply = opts['parent_reply']
    @author_id = opts['author_id']
    @body = opts['body']
  end

  def self.find_by_user_id(author_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE author_id = #{author_id}")
    raise 'User has never asked a question' if data.empty?

    data.map { |datum| Reply.new(datum) }
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE subject_question = #{question_id}")
    raise 'No replies' if data.empty?
    data.map { |datum| Reply.new(datum) }
  end

  def author
    data = QuestionsDatabase.instance.execute("SELECT * FROM users WHERE user = #{@author_id}")
    raise "author not found (STRANGE: EVERY QUESTION SHOULD HAVE AUTHOR)" if data.empty?
    User.new(data.first)
  end

  def question
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions WHERE question = #{@subject_question}")
    raise 'Question not found (STRANGE: EVERY REPLY SHOULD HAVE QUESTION' if data.empty?
    Question.new(data.first)
  end

  def parent_reply
    raise 'Parent reply not found' unless @parent_reply
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE reply = #{@parent_reply}")
    Reply.new(data.first)
  end

  def child_replies
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies WHERE parent_reply = #{@reply}")
    raise 'No children' if data.empty?
    Reply.new(data.first)
  end

end
