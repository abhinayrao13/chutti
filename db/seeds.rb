Role.create!([
  {user_role: "admin"},
  {user_role: "employee"}
])
User.create!([
  {email: "chuttikaboss@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 80, current_sign_in_at: "2016-03-08 10:36:57", last_sign_in_at: "2016-03-08 04:37:05", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "vivek", gender: "male", phone_no: "1234567890", role_id: 1, max_leaves: 10, image_uid: "icon-user-default.png"},
  {email: "sampathmanikanta8@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 13, current_sign_in_at: "2016-03-05 08:14:48", last_sign_in_at: "2016-03-05 06:27:09", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "mani", gender: "male", phone_no: "1234567890", role_id: 2, max_leaves: 5, image_uid: "icon-user-default.png"},
  {email: "kiran@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-03-08 01:10:28", last_sign_in_at: "2016-03-05 05:45:14", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "kiran", gender: "male", phone_no: "1234567890", role_id: 2, max_leaves: 12, image_uid: "icon-user-default.png"},
  {email: "madhu@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 3, current_sign_in_at: "2016-03-08 00:06:56", last_sign_in_at: "2016-03-05 06:41:37", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "madhu", gender: "male", phone_no: "1234567890", role_id: 2, max_leaves: 12, image_uid: "icon-user-default.png"},
  {email: "fazalvjit81@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 6, current_sign_in_at: "2016-03-08 01:30:54", last_sign_in_at: "2016-03-07 23:40:46", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "fazal", gender: "male", phone_no: "1234567890", role_id: 2, max_leaves: 12, image_uid: "icon-user-default.png"},
  {email: "abhinayrao13@gmail.com", password: "12345678", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-03-08 03:57:41", last_sign_in_at: "2016-03-08 02:12:37", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "ABHINAY", gender: "male", phone_no: "1234567890", role_id: 2, max_leaves: 12, image_uid: "icon-user-default.png"}
])
Checkin.create!([
  {user_id: 2, date: "2016-03-04", check_in: "2016-03-04 03:53:48", check_out: "2016-03-04 06:52:22"},
  {user_id: 5, date: "2016-03-04", check_in: "2016-03-04 03:54:37", check_out: "2016-03-04 05:14:45"},
  {user_id: 3, date: "2016-03-04", check_in: "2016-03-04 08:18:23", check_out: nil},
  {user_id: 4, date: "2016-03-04", check_in: "2016-03-04 08:18:26", check_out: nil},
  {user_id: 6, date: "2016-03-05", check_in: "2016-03-05 08:01:16", check_out: "2016-03-05 08:01:23"},
  {user_id: 2, date: "2016-03-05", check_in: "2016-03-05 08:01:50", check_out: "2016-03-05 08:01:51"},
  {user_id: 1, date: "2016-03-08", check_in: "2016-03-08 01:21:10", check_out: "2016-03-08 01:21:12"}
])
Leave.create!([
  {reason_for_leave: "headacehe", user_id: 2, status: "pending", leave_date_from: "2016-03-04", leave_date_to: "2016-03-05"},
  {reason_for_leave: "fever", user_id: 3, status: "pending", leave_date_from: "2016-03-23", leave_date_to: "2016-03-26"},
  {reason_for_leave: "back pain", user_id: 4, status: "pending", leave_date_from: "2016-05-07", leave_date_to: "2016-05-10"},
  {reason_for_leave: "stomach pain", user_id: 5, status: "pending", leave_date_from: "2016-04-04", leave_date_to: "2016-04-07"},
  {reason_for_leave: "sister marriage", user_id: 2, status: "pending", leave_date_from: "2016-04-04", leave_date_to: "2016-04-07"},
  {reason_for_leave: "brother marriage", user_id: 3, status: "pending", leave_date_from: "2016-04-05", leave_date_to: "2016-04-08"},
  {reason_for_leave: "grand father expired", user_id: 6, status: "pending", leave_date_from: "2016-04-05", leave_date_to: "2016-04-08"},
  {reason_for_leave: "personal", user_id: 5, status: "pending", leave_date_from: "2016-04-04", leave_date_to: "2016-04-06"}
])
Notice.create!([
  {subject: "salutation", content: "hello all, good eveng", user_id: 2, posted_on: "2016-03-04"},
  {subject: "HELLO", content: "Welcome to chutti app", user_id: 1, posted_on: "2016-03-08"},
  {subject: "story", content: "When Poppy Malone (daredevil and aspiring celebrity)\n is kicked out of drama club, she isn't about to let th..", user_id: 1, posted_on: "2016-03-05"},
  {subject: "check in", content: "Hello, \r\n           Today we have introduced a new policy for all the employees. Now on all the employees have to check in when they arrive and should checkout while leaving the office premises. \r\n\r\nThank You.", user_id: 3, posted_on: "2016-03-05"},
  {subject: "rafeeq Engaement", content: "plan to warangal in car", user_id: 4, posted_on: "2016-03-05"},
  {subject: "fazal", content: "cancled goa plan and going to\r\n", user_id: 4, posted_on: "2016-03-05"}
])
