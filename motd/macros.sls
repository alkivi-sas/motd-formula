{%- macro motd_role(name, role, state='present') -%}
motd_{{ name }}:
  file.managed:
    - name: /etc/motd.d/{{ name }}
    - contents: '{{ role }}'
    - mode: 444
    - require:
      - file: /etc/motd.d
{%- endmacro -%}
