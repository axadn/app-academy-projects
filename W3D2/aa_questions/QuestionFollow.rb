require_relative 'QuestionsDatabase.rb'
require_relative 'Reply.rb'
require_relative 'User.rb'
require_relative 'QuestionLike.rb'

class QuestionFollow
  attr_accessor :question_follow, :user_id, :question_id

  def initialize(opts)
    @question_follow = opts['question_follow']
    @user_id = opts['user_id']
    @question_id = opts['question_id']
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        users
      JOIN
        question_follows ON users.user = question_follows.question_follow
      WHERE
        question_id = ?
    SQL
    raise " no followers" if data.empty?
    data.map{|row| User.new(row)}
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        questions
      JOIN
        question_follows
      ON
        question_follow = question
      WHERE
        user_id = ?
    SQL
    raise "no followed questions" if data.empty?
    data.map{|row| Question.new(row)}
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
       *
    FROM
      (
      SELECT
        question_id, Count(*) as followers
      FROM
        question_follows
      GROUP BY
        question_id
      ORDER BY
        followers DESC
      LIMIT
        ?
      ) as follower_counts
      JOIN
        questions ON follower_counts.question_id = questions.question
    SQL

    data.map { |datum| Question.new(datum) }

  end

  def likers
    QuestionLike.likers_for_question_id(@question)
  end

  def num_likes
    QuestionLike.num_likes_for_question_id(@question)
  end

  

end
