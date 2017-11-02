base:
  "*":
    - ssh
    - users
    - common
  "dev*":
    - common
    - dev
    - users
    - ssh
