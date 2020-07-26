#!/home/hypen9/.pyenv/shims/python

import sys
import json
# import re
import datetime
real_notes_p = '/home/hypen9/Documents/code/tasking/notes-org/real_life.org'
new_task_template ="""
** TODO {} {}
   SCHEDULED: <{}>

"""
output_date_format = '%Y-%m-%d %a %H:%M'
# SCHEDULED: <2019-12-01 нд 09:00>
added_task = json.loads(sys.stdin.readline())
print(json.dumps(added_task))
if added_task.get('project', None) == 'zy_energy':
    # print('a matched task', file=sys.stderr)
    descr = added_task['description']
    uuid = added_task['uuid']


    if added_task.get('due', None) is None:
        # print('no due date', file=sys.stderr)
        now = datetime.datetime.now()
        out_date = now.strftime(output_date_format)
        # print('out date: %s' % out_date, file=sys.stderr)

    else:
        due_date_str = added_task['due']
        # print("due date is %s" % due_date_str, file=sys.stderr)
        input_date_format = '%Y%m%dT%H%M%SZ'
        due_date_utc = datetime.datetime.strptime(due_date_str, input_date_format)
        due_date = due_date_utc + datetime.timedelta(hours=2)
        out_date = due_date.strftime(output_date_format)
        # print('out date: %s' % out_date, file=sys.stderr)

        # "20191130T070000Z"

    template_form = new_task_template.format(descr, uuid, out_date)
    # print('%s' % template_form, file=sys.stderr)
    with open(real_notes_p, 'a') as notes:
        notes.write(template_form)


sys.exit(0)
