User.create!([
  {email: "chuttikaboss@gmail.com", encrypted_password: "$2a$10$WVhumGy344y.vQDIDOhcjOUWmNiydzYdVY/HDUkVeuqQClo1goGxW", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 79, current_sign_in_at: "2016-03-08 10:07:05", last_sign_in_at: "2016-03-08 10:04:32", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "vivek", gender: "male", phone_no: "1234567890", role_id: 16, max_leaves: 10, image_uid: "2016/03/08/h1py3mypy_12063800_10156210421610080_9072786089262459141_n.jpg"},
  {email: "sampathmanikanta8@gmail.com", encrypted_password: "$2a$10$7ZFE0GdQyJ.Xe5iOQn4MqOVSCy43qwjGJ/w3pkFcVYjjRbHA36AD2", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 13, current_sign_in_at: "2016-03-05 13:44:48", last_sign_in_at: "2016-03-05 11:57:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "mani", gender: "male", phone_no: "1234567890", role_id: 17, max_leaves: 5, image_uid: "2016/03/04/9o97zzcbcd_user1_128x128.jpg"},
  {email: "kiran@gmail.com", encrypted_password: "$2a$10$xqlUEZFbEpxwansaurEwT.QohGSCyCgzf5LUYmAGxpO7O7fPJEEdi", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-03-08 06:40:28", last_sign_in_at: "2016-03-05 11:15:14", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "kiran", gender: "male", phone_no: "1234567890", role_id: 17, max_leaves: 12, image_uid: "2016/03/05/7399oqan7w_photo2.png"},
  {email: "madhu@gmail.com", encrypted_password: "$2a$10$7p/GRF24yh4dueBsK0JC8.3HhqPaFaYNrOGEejCg07d5Eh1D3t/Ci", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2016-03-08 05:36:56", last_sign_in_at: "2016-03-05 12:11:37", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "madhu", gender: "male", phone_no: "1234567890", role_id: 17, max_leaves: 12, image_uid: "2016/03/05/94a4l34ykc_143.jpg"},
  {email: "fazalvjit81@gmail.com", encrypted_password: "$2a$10$RzFNXWvtSd4KizLi7JpVeu3Verzw6S9AXzuD56.jM9xf/as26YBgu", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-03-08 07:00:54", last_sign_in_at: "2016-03-08 05:10:46", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "fazal", gender: "male", phone_no: "1234567890", role_id: 17, max_leaves: 12, image_uid: "2016/03/05/5uq3sr14g7_63.jpg"},
  {email: "abhinayrao13@gmail.com", encrypted_password: "$2a$10$uInFTbujeabHytBKAiDBse66UGgfA6u7GmyVEYXskZmMK0mfCXUTO", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-03-08 09:27:41", last_sign_in_at: "2016-03-08 07:42:37", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "ABHINAY", gender: "male", phone_no: "1234567890", role_id: 17, max_leaves: 12, image_uid: "icon-user-default.png"}
])
Role.create!([
  {user_role: "admin"},
  {user_role: "employee"}
])
Checkin.create!([
  {user_id: 1, date: "2016-03-04", check_in: "2016-03-04 09:23:48", check_out: "2016-03-04 12:22:22"},
  {user_id: 10, date: "2016-03-04", check_in: "2016-03-04 09:24:37", check_out: "2016-03-04 10:44:45"},
  {user_id: 1, date: "2016-03-04", check_in: "2016-03-04 13:48:23", check_out: nil},
  {user_id: 10, date: "2016-03-04", check_in: "2016-03-04 13:48:26", check_out: nil},
  {user_id: 15, date: "2016-03-05", check_in: "2016-03-05 13:31:16", check_out: "2016-03-05 13:31:23"},
  {user_id: 15, date: "2016-03-05", check_in: "2016-03-05 13:31:50", check_out: "2016-03-05 13:31:51"},
  {user_id: 12, date: "2016-03-08", check_in: "2016-03-08 06:51:10", check_out: "2016-03-08 06:51:12"}
])
Leave.create!([
  {reason_for_leave: "headacehe", user_id: 1, status: "accepted", leave_date_from: "2016-03-04", leave_date_to: "2016-03-05"},
  {reason_for_leave: "fever", user_id: 1, status: "declined", leave_date_from: "2016-03-23", leave_date_to: "2016-03-26"},
  {reason_for_leave: "back pain", user_id: 10, status: "accepted", leave_date_from: "2016-05-07", leave_date_to: "2016-05-10"},
  {reason_for_leave: "stomach pain", user_id: 10, status: "accepted", leave_date_from: "2016-04-04", leave_date_to: "2016-04-07"},
  {reason_for_leave: "sister marriage", user_id: 1, status: "declined", leave_date_from: "2016-04-04", leave_date_to: "2016-04-07"},
  {reason_for_leave: "brother marriage", user_id: 1, status: "accepted", leave_date_from: "2016-04-05", leave_date_to: "2016-04-08"},
  {reason_for_leave: "grand father expired", user_id: 10, status: "pending", leave_date_from: "2016-04-05", leave_date_to: "2016-04-08"},
  {reason_for_leave: "personal", user_id: 10, status: "accepted", leave_date_from: "2016-04-04", leave_date_to: "2016-04-06"}
])
Notice.create!([
  {subject: "salutation", content: "hello all, good eveng", user_id: 10, posted_on: "2016-03-04"},
  {subject: "HELLO", content: "Welcome to chutti app", user_id: 1, posted_on: "2016-03-08"},
  {subject: "story", content: "When Poppy Malone (daredevil and aspiring celebrity)\n is kicked out of drama club, she isn't about to let th..", user_id: 1, posted_on: "2016-03-05"},
  {subject: "check in", content: "Hello, \r\n           Today we have introduced a new policy for all the employees. Now on all the employees have to check in when they arrive and should checkout while leaving the office premises. \r\n\r\nThank You.", user_id: 12, posted_on: "2016-03-05"},
  {subject: "rafeeq Engaement", content: "plan to warangal in car sdfsdf", user_id: 15, posted_on: "2016-03-05"},
  {subject: "fazal", content: "cancled goa plan and going to\r\n", user_id: 15, posted_on: "2016-03-05"}
])
