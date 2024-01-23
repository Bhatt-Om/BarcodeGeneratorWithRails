# Student Exam Barcode:

## Modal , Tables

### Studnet:
  {
    name: string
    email: string
    enroll_number: string
    fee_status: boolean
    eligiable_for_exam: boolean
  }

### Subject:
  {
    name: string
  }

### Exam:
  {
    exam_name: string
    student_id: refernce student
    subject_id: refernce subject
  }

### marks:
  {
    studnent_id:
    exam_id:
    subject_id: 
  }
