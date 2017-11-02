{% for user, args in pillar.get('users', {}).iteritems() %}
{{user}}:
  group.present:
    - gid: {{ args['uid'] }}
  user.present:
    - fullname: {{ args['fullname'] }}
    - uid: {{ args['uid'] }}
    - gid: {{ args['uid'] }}
    - shell: /bin/bash
    {% if grains['os'] == 'Ubuntu' %}
    - groups:
      - sudo
      - adm
      - dip
      - cdrom
      - plugdev
    {% endif %}

{% if args['ssh-keys'] %}
{{user}}_root_key:
  ssh_auth.present:
    - user: root
    - names:
      {% for key in args['ssh-keys'] %}
      - {{ key }}
      {% endfor %}

{{user}}_key:
  ssh_auth.present:
    - user: {{user}}
    - names:
      {% for key in args['ssh-keys'] %}
      - {{ key }}
      {% endfor %}
{% endif %}
{% endfor %}
