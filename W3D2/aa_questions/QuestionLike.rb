require_relative 'QuestionsDatabase.rb'
require_relative 'Reply.rb'
require_relative 'User.rb'
require_relative 'QuestionFollow.rb'

class QuestionLike

  attr_accessor :questionlike, :question_id, :user_id

  def initialize(opts)
    @questionlike = opts['questionlike']
    @question_id = opts['question_id']
    @user_id = opts['user_id']
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        users
      ON
        user = user_id
      WHERE
        question_id = ?
    SQL
    data.map { |datum| User.new(datum) }
  end


  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
       *
    FROM
      (
      SELECT
        question_id, Count(*) as likes
      FROM
        question_likes
      GROUP BY
        question_id
      ORDER BY
        likes DESC
      LIMIT
        ?
      ) as like_counts
    JOIN
        questions ON like_counts.question_id = questions.question
    SQL

    data.map { |datum| Question.new(datum) }

  end

  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        count(*)
      FROM
        question_likes
      WHERE
        question_id = ?
    SQL
    data.first.values.first
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        question_likes
      JOIN
        questions
      ON
        question = question_id
      WHERE
        user_id = ?
    SQL
    raise 'No liked questions found for user' if data.empty?
    data.map { |datum| Question.new(datum) }
  end

end
