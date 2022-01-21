-- SQLite
INSERT INTO employees (name, position, email, active, branch_id, created_at, updated_at) VALUES ("marcelo","developer_web","email@gmail.com", true, 1, "2022-02-02 02:02:22", "2022-02-02 02:02:22");
INSERT INTO employees (name, position, email, active, branch_id, created_at, updated_at) VALUES ("diego","developer_web","email@gmail.com", true, 1, "2022-02-02 02:02:22", "2022-02-02 02:02:22");
INSERT INTO employees (name, position, email, active, branch_id, created_at, updated_at) VALUES ("rene","developer_web","email@gmail.com", true, 1, "2022-02-02 02:02:22", "2022-02-02 02:02:22");
INSERT INTO employees (name, position, email, active, branch_id, created_at, updated_at) VALUES ("armani","developer_web","email@gmail.com", true, 1, "2022-02-02 02:02:22", "2022-02-02 02:02:22");
INSERT INTO employees (name, position, email, active, branch_id, created_at, updated_at) VALUES ("irene","developer_web","email@gmail.com", true, 1, "2022-02-02 02:02:22", "2022-02-02 02:02:22");


-- INSERT INTO branches (name, direction, created_at, updated_at) VALUES ("US", "asdfasdf", "2022-02-02 02:02:22", "2022-02-02 02:02:22" );

 INSERT INTO checks (entrance, out, employee_id, created_at, updated_at) VALUES ("2022-02-02 02:02:22","2022-02-02 05:05:22", 1,"2022-02-02 05:05:22", "2022-02-02 05:05:22");

 DELETE FROM checks WHERE id >  30;