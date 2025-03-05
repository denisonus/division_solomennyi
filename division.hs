module Division where

courses :: [String]
courses = ["english", "math"]

students :: [String]
students = ["alice", "bob", "clark", "david", "emily"]

studentCourses :: [(String, String)]
studentCourses =
  [ ("alice", "english"),
    ("alice", "history"),
    ("bob", "english"),
    ("bob", "history"),
    ("bob", "math"),
    ("clark", "math"),
    ("emily", "english"),
    ("emily", "history"),
    ("emily", "math"),
    ("emily", "biology")
  ]

studentHasCourse :: String -> String -> Bool
studentHasCourse student course = (student, course) `elem` studentCourses

qualifiedStudents :: [String]
qualifiedStudents = filter (\student -> all (studentHasCourse student) courses) students

main :: IO ()
main = do
  print qualifiedStudents
