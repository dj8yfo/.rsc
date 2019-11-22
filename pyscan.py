import os
import string
from datetime import datetime, timezone

valid_chars = "-_%s%s" % (string.ascii_letters, string.digits)
startfold = os.path.abspath(os.path.curdir)
idmfolder = os.path.join(startfold, "idm")
djentfolder = os.path.join(startfold, "djent")
idmsubfolder = os.path.join(startfold, "idm", "sort")
djentsubfolder = os.path.join(startfold, "djent", "sort")
print("startfolder: {0}".format(startfold))


def normalize_filame(filename):
    return ''.join(c for c in filename if c in valid_chars)


def recursive_traverse(fold, level=0):
    tabs = "\t" * level
    curdir = os.path.basename(fold)
    print("{}traversing: {}".format(tabs, fold))
    for filename in os.listdir(fold):
        targetdir = ""
        filep = os.path.join(fold, filename)
        if (idmfolder in filep):
            targetdir = idmsubfolder
        elif (djentfolder in filep):
            targetdir = djentsubfolder
        else:
            continue
        if not (filep == idmsubfolder) \
                and not (filep == djentsubfolder):
            if os.path.isdir(filep):
                recursive_traverse(filep, level + 1)
                if not (filep == idmfolder) and \
                    not (filep == djentfolder):
                    print("{}removing: {}".format(tabs, filep))
                    os.rmdir(filep)
            else:

                filename, file_extension = os.path.splitext(filename)
                filename = ''.join([curdir, filename])
                normalized_path = normalize_filame(filename)
                newfilename = ''.join([normalized_path, file_extension])
                lastm_date = datetime.fromtimestamp(
                    os.path.getmtime(filep), timezone.utc).strftime('%Y_%m_%d')
                sorted_date_dir = os.path.join(targetdir, lastm_date)
                if not os.path.exists(sorted_date_dir):
                    print("{}mkdir: {}".format(tabs, sorted_date_dir))
                    os.mkdir(sorted_date_dir)
                dest = os.path.join(sorted_date_dir, newfilename)
                print("{}os.rename: {} -> {} ".format(tabs, filep, dest))
                os.rename(filep, dest)
        else:
            print("{}skipped sorted: {}".format(tabs, filep))


recursive_traverse(startfold)
