{%- macro motd_role(name, role, state='present') -%}
motd_{{ name }}:
  file.managed:
    - name: /etc/motd.d/{{ name }}
    - contents: '{{ role }}'
    - mode: 444
    - require:
      - file: /etc/motd.d
{%- endmacro -%}

{%- macro motd_package_role(name, role, package='', state='present') -%}
{{ motd_role(name, role, state) }}
{%- endmacro -%}
