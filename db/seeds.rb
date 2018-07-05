Investor.create!([
  {email: "example@ex.com", password: "example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-06-18 15:35:21", last_sign_in_at: "2018-06-18 15:35:21", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "example", skype: nil, phone: nil},
  {email: "ex1@ex.com", password: "example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil, name: "example1", skype: nil, phone: nil}
])
Trader.create!([
  {email: "ex@ex.com", password: "example", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2018-06-18 15:38:20", last_sign_in_at: "2018-06-18 15:38:20", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", name: "example3", skype: nil, phone: nil}
])
Idea.create!([
  {name: "test1", description: "test1test1test1example", problem: "test1test1", industry: "test1test1", team: "test1", geographical_focus: "test1test1test1", requirements: "vbtest1test1n", next_steps: "test1test1", publication_end_date: "2018-06-19", trader_id: 1},
  {name: "test2", description: "test2test2test2", problem: "test2test2", industry: "test2test2", team: "test2", geographical_focus: "rtest2", requirements: "test2", next_steps: "test2", publication_end_date: "2018-06-20", trader_id: 1},
  {name: "test3", description: "test3exampleexampleexample", problem: "test3exampleexample", industry: "test3example", team: "test3", geographical_focus: "3testtest33", requirements: "3test3test3", next_steps: "test3test33", publication_end_date: "2018-06-19", trader_id: 1},
  {name: "test213333333333333331", description: "qtest3test3", problem: "qtest3test3", industry: "qtest3", team: "qtestest3t3", geographical_focus: "qtest3test3", requirements: "qtest3test3", next_steps: "qtestest3t3", publication_end_date: "2018-06-18", trader_id: 1},
  {name: "444444444444444444", description: "test3test3test34", problem: "test3test34", industry: "test3test34", team: "4test3test3", geographical_focus: "test3test34", requirements: "4test3test3", next_steps: "test3test34", publication_end_date: "2018-06-19", trader_id: 1}
])
