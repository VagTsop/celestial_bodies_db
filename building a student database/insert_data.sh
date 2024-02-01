#!/bin/bash

# Script to insert data from courses.csv and students.csv into students database

# Define the psql command with options for connection and formatting
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

# Truncate tables to clear existing data
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

# Process courses.csv
cat courses.csv | while IFS="," read MAJOR COURSE
do
  # Check if the line is not the header
  if [[ $MAJOR != "major" ]]
  then
    # Get major_id from majors table
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # If major not found, insert it into majors table
    if [[ -z $MAJOR_ID ]]
    then
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into majors, $MAJOR
      fi

      # Get the new major_id
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # Get course_id from courses table
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")   

    # If course not found, insert it into courses table
    if [[ -z $COURSE_ID ]]
    then
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into courses, $COURSE"
      fi

      # Get the new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # Insert the mapping of major_id and course_id into majors_courses table
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into majors_courses, $MAJOR : $COURSE"
    fi
  fi
done

# Process students.csv
cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  # Check if the line is not the header
  if [[ $FIRST != "first_name" ]]
  then
    # Get major_id from majors table
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # If major not found, set MAJOR_ID to null
    if [[ -z $MAJOR_ID ]]
    then
      MAJOR_ID=null
    fi

    # Insert student into students table
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST', '$LAST', $MAJOR_ID, $GPA)")
    if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
      echo "Inserted into students, $FIRST $LAST"
    fi
  fi
done
