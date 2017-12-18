require_relative 'QuestionsDatabase.rb'

class User < ModelBase
  attr_accessor :user, :fname, :lname
  def initialize(opts)
    @user = opts['user']
    @fname = opts['fname']
    @lname = opts['lname']
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute("SELECT * FROM users
             WHERE fname = '#{fname}' AND lname = '#{lname}'")
    raise "no such user" if data.empty?
    User.new(data.first)
  end

  def authored_questions
    Question.find_by_author_id(@user)
  end

  def authored_replies
    Reply.find_by_user_id(@user)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@user)
  end

  def liked_questions
    QuestionLike.liked_questions_for_user_id(@user)
  end

  def average_karma
    QuestionsDatabase.instance.execute(<<-SQL, @user, @user)
      SELECT
         like_count.count / question_count.count
      FROM
        (SELECT
          0 as id, Count(Distinct(question)) as count
        FROM
          questions
        WHERE
          author = ?
        ) as question_count
      JOIN
        (SELECT
          0 as id, count(*) as count
        FROM
          question_likes
        JOIN
          questions ON question = question_id
        WHERE
          user_id = ?
        ) as like_count ON like_count.id = question_count.id
    SQL
  end

  def save
    if @user
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @user)
        UPDATE
          users
        SET
          fname = ?, lname = ?
        WHERE
          user = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @user)
        INSERT INTO
          users
          (fname,lname)
        VALUES
          (?,?)
      SQL
      @user = QuestionsDatabase.instance.last_insert_row_id
    end
  end

end
