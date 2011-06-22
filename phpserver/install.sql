CREATE TABLE sessions (
  id CHAR(32) NOT NULL,
  data TEXT,
  last_accessed TIMESTAMP NOT NULL,
  PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE servers (
  id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  url VARCHAR(255) NOT NULL,
  port VARCHAR(10) NOT NULL,
  sapass CHAR(32) NOT NULL,
  occupied BOOLEAN NOT NULL DEFAULT FALSE,
  acquire_time TIMESTAMP DEFAULT 0,
  last_used TIMESTAMP DEFAULT 0 ON UPDATE CURRENT_TIMESTAMP,
  session_id CHAR(32) DEFAULT NULL,
  INDEX sess_ind (session_id),
  FOREIGN KEY (session_id) REFERENCES sessions(id)
    ON DELETE SET NULL,
  UNIQUE KEY (url, port)
) ENGINE=INNODB;
