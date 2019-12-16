import subprocess
import os

all_unique_tags = set()
compl_pr = subprocess.run(["task", "+ref", "uuids"], capture_output=True)
# print(compl_pr.stdout)
uuids = compl_pr.stdout.decode().split()
for uuid in uuids:
    uuid = uuid.rstrip()
    link = f"{uuid}.tags"
    # print(link)
    tags_pr = subprocess.run(["task", "_get", link], capture_output=True)
    # print(tags_pr.stdout)
    tags = tags_pr.stdout.decode().split(',')
    for tag in tags:
        tag = tag.rstrip()
        if len(tag) >= 3:
            all_unique_tags.add(tag)
        # print(tag, end=' ')
    # print()
all_unique_tags.remove('ref')
all_unique_tags = list(all_unique_tags)
all_unique_tags = sorted(all_unique_tags, key=len)

tags_file = f'{os.environ["HOME"]}/.unique_taskwarrior_tags'
with open(tags_file, 'w') as tagf:
    for tag in all_unique_tags:
        tagf.write(tag)
        tagf.write('\n')



cfg_color_file=f'{os.environ["HOME"]}/.config/.taskwcolorrc'
print(cfg_color_file)
template = 'ms=40;38;5;{color_num}:sl=48;5;234	{tag}\\\\W\n'
template_rigid = 'ms=40;38;5;171:sl=48;5;234	~\\\\S+~\n'
template_rigid1 = 'ms=40;38;5;229:sl=48;5;234	ref\\\\W\n'
iter_color = 120
with open(cfg_color_file, 'w') as cfg:
    for tag in all_unique_tags:
        iter_color = (iter_color + 1) % 232
        if iter_color == 0:
            iter_color += 1
        template_form = template.format(color_num=iter_color, tag=tag)
        print(template_form, end='')
        cfg.write(template_form)
    cfg.write(template_rigid)
    cfg.write(template_rigid1)

