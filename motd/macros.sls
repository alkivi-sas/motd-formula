{%- macro motd_role(name, role, state='present') -%}
{% if state == "present" %}
motd_{{ name }}:
  file.managed:
    - name: /etc/motd.d/{{ name }}
    - contents: '{{ role }}'
    - mode: 444
    - require:
      - file: /etc/motd.d
{% elif state == "absent" %}
motd_{{ name }}:
  file.absent:
    - name: /etc/motd.d/{{ name }}
{% endif %}
{%- endmacro -%}

{%- macro motd_package_role(name, role, package='', state='present') -%}
{{ motd_role(name, role, state) }}
{%- endmacro -%}
