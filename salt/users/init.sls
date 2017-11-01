users_admin_user:
  user.present:
    - name: admin
    - home: /home/admin
    - shell: /bin/bash
    - groups:
      - sudo
      - adm
