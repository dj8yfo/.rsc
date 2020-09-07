import subprocess
import os
import random
import io
import concurrent.futures

def convert(uuid):
    res = []
    uuid = uuid.rstrip()
    link = f"{uuid}.tags"
    tags_pr = subprocess.run(["task", "_get", link], capture_output=True)
    tags = tags_pr.stdout.decode().split(',')
    for tag in tags:
        tag = tag.rstrip()
        if len(tag) >= 3:
            res.append(tag)
    return res

if __name__ == '__main__':
    print('Running tag generation for .taskwcolorrc...')
    all_unique_tags = set()
    compl_pr = subprocess.run(["task", "+ref", "uuids"], capture_output=True)
    uuids = compl_pr.stdout.decode().split()

    with concurrent.futures.ProcessPoolExecutor() as executor:
        for tag_res in executor.map(convert, uuids):
            # print('new tags: %s' % tag_res)
            all_unique_tags.update(tag_res)


    all_unique_tags.remove('ref')
    all_unique_tags = list(all_unique_tags)
    all_unique_tags = sorted(all_unique_tags, key=len, reverse=True)

    tags_file = f'{os.environ["HOME"]}/.unique_taskwarrior_tags'

    with open(tags_file, 'w') as tagf:
        out = io.StringIO('')
        for tag in all_unique_tags:
            out.write(tag)
            out.write('\n')
        tagf.write(out.getvalue())


    # task rule /credentials/ --> rgb200 match
    cfg_color_file=f'{os.environ["HOME"]}/.config/.taskwcolorrc'
    cfg_base_file=f'{os.environ["HOME"]}/Documents/.conf/base_color_rules'
    print(cfg_color_file)
    print(cfg_base_file)
    with open(cfg_base_file, 'r') as base_cfg:
        base_rules = base_cfg.read()

    # template = 'ms=40;38;5;{color_num}:sl=48;5;234	{tag}\\\\b\n'
    template = r'task rule /\b{tag}\b/ --> color{color_num} match'
    # template_rigid = 'ms=40;38;5;171:sl=48;5;234	~\\\\S+~\n'
    iter_color = 120
    with open(cfg_color_file, 'w') as cfg:
        out = io.StringIO('')
        for tag in all_unique_tags:
            iter_color = random.randint(1, 255)
            template_form = template.format(color_num=iter_color, tag=tag)
            out.write(template_form)
            out.write('\n')
        cfg.write(base_rules)
        cfg.write('\n')
        cfg.write(out.getvalue())

