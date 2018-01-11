<?php

	


class SqlDummy {
	const TABLE = 'submissions';
	const USERNAME = 'root';
	const PASSWORD = '12345678';
	const DSN = 'mysql:host=localhost;dbname=Test;charset=utf8';
	const NUM_OF_RECORDS = 80;
	// const $COLUMNS = [
	// 	'email' => 'VARCHAR(127) DEFAULT \'\'',
	// 	'username' => 'VARCHAR(32) DEFAULT \'\'',

	// ];
	public static $COLUMNS = array(
		'email' => 'VARCHAR(127) DEFAULT \'\'', 
		'username' => 'VARCHAR(32) DEFAULT \'\'',
		);

	// public static $keys = array_keys($COLUMNS, '\'\'');
	// for ($i=0 ; $i < NUM_OF_RECORDS; $i++){
	// 	echo $keys[$i] . ' ' . $COLUMNS[$keys[$i]] . "\n";
	// }

	
	

	public function isTableExists(){
		try{
			$dbh = new PDO(self::DSN, self::USERNAME, self::PASSWORD);
			$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			$exists = $dbh->query(sprintf('SHOW TABLES LIKE \'%s\'', self::TABLE))->rowCount() > 0;
			$dbh = null;
		}catch(PDOException $e){
			die($e->getMessage() . PHP_EOL);
		}
		return $exists;
	}

	public function createTable(){
		try {
			$dbh = new PDO(self::DSN, self::USERNAME, self::PASSWORD);
			$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			$sql = 'CREATE TABLE ' . self::TABLE . '('
				 . 'id INT(10) NOT NULL AUTO_INCREMENT,';
			foreach (self::$COLUMNS as $col => $meta) {
				$sql .= $col . ' ' . $meta . ',';
			}
			$sql .= 'PRIMARY KEY(id)'
				. ') ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci';
			$dbh->exec($sql);

			$dbh = null;
		} catch(PDOException $e) {
			die($e->getMessage() . PHP_EOL);
		}
	}

	public function insertRecords() {
		try {
			$dbh = new PDO(self::DSN, self::USERNAME, self::PASSWORD);
			$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

			$dbh->beginTransaction();
			
			$value_testcase = 1;
			$id = 147215;
			$c = 1;
			$d = 25;
			$contest_id = 901;
			$problem_id = 801;
			$role = 2;
			$score = 100;
			$a = 'A';
			$verdict = 'Accepted';
			$grade_content = '{"verdict":"Accepted","output":"Testcase #1\tin : 2a3.in out: 2a3.out\n\tOK (0.040 sec real, 0.043 sec wall, 0 syscalls)\n\tAccepted\nTestcase #2\tin : 2a2.in out: 2a2.out\n\tOK (0.036 sec real, 0.039 sec wall, 0 syscalls)\n\tAccepted\nTestcase #3\tin : 2a3.in out: 2a3.out\n\tOK (0.032 sec real, 0.035 sec wall, 0 syscalls)\n\tAccepted\nTestcase #4\tin : 2a4.in out: 2a4.out\n\tOK (0.036 sec real, 0.037 sec wall, 0 syscalls)\n\tAccepted\nTestcase #5\tin : 2a5.in out: 2a5.out\n\tOK (0.036 sec real, 0.036 sec wall, 0 syscalls)\n\tAccepted\nTestcase #6\tin : 2a1.in out: 2a1.out\n\tOK (0.032 sec real, 0.036 sec wall, 0 syscalls)\n\tAccepted\n","total_testcase":6,"right_testcase":6}';

			for ($i = 0; $i <= self::NUM_OF_RECORDS; $i++) {
				// if($c == 95){
				// 	$a = 'B';
				// 	$c = 10;
				// 	$d = 15;
				// 	$problem_id = 802;
				// }
				// if($c == $d){
				// 	$c = $c + 5;
				// 	$d = $d + 10;
				// }
				// $submit_content = '{"source_lang":"c","original_name":"'.$a.$c.'.c","source_content":""}';
				if($c == 46){
					$problem_id = 802;
				}
				$username = "user" . $c;
				// $email = $username . "@gmail.com";
				$sql = sprintf("INSERT INTO plagiarism (contest_id, problem_id, username) VALUES('$contest_id', '$problem_id', '$username')");
				$stmt = $dbh->prepare($sql);
				$stmt->execute($values);
				$id++;
				$c++;
			}

			$dbh->commit();

			$dbh = null;
		} catch(PDOException $e) {
			die($e->getMessage() . PHP_EOL);
		}
	}

}

$sql_dummy = new SqlDummy();
if (!$sql_dummy->isTableExists()) {
	printf('Table \'%s\' not exists, creating...' . PHP_EOL, SqlDummy::TABLE);
	$sql_dummy->createTable();
}

printf('Inserting %d records...' . PHP_EOL, SqlDummy::NUM_OF_RECORDS);
$sql_dummy->insertRecords();

echo 'Done!' . PHP_EOL;
?>