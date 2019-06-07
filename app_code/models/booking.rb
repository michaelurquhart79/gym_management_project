require_relative('../db/sql_runner')

class Booking

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @member_id = options['member_id'].to_i
    @gym_class_id = options['gym_class_id'].to_i
  end

  def save()
    sql = "INSERT INTO bookings
    (member_id, gym_class_id) VALUES ($1, $2)
    RETURNING id"
    values = [@member_id, @gym_class_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end




end
