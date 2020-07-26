#!/home/hypen9/.pyenv/shims/python

import sys
import json
import datetime
import os

#alarm "04:55 2019-12-05"
alarm_schedule_date_format = '%H:%M %Y-%m-%d'
added_task = json.loads(sys.stdin.readline())
print(json.dumps(added_task))
if 'alarm' in added_task.get('tags', [None]):
    # print(f'a matched task: {added_task.get("tags")}', file=sys.stderr)
    descr = added_task['description']
    uuid = added_task['uuid']

    if added_task.get('due', None) is None:
        # print('no due date', file=sys.stderr)
        sys.exit(0)

    else:
        due_date_str = added_task['due']
        # print("due date is %s" % due_date_str, file=sys.stderr)
        input_date_format = '%Y%m%dT%H%M%SZ'
        due_date_utc = datetime.datetime.strptime(due_date_str, input_date_format)
        due_date = due_date_utc + datetime.timedelta(hours=3)
        schedule_date = due_date.strftime(alarm_schedule_date_format)
        # print('schedule date: %s' % schedule_date, file=sys.stderr)
        cmd_template = f'alarm "{schedule_date}"'
        # print(cmd_template)
        os.system(cmd_template)
        # os.system('task +alarm')


sys.exit(0)
