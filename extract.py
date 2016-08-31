#!/usr/bin/python3
# -*- coding: utf-8 -*-

import argparse
import shutil
import os
import sys

files = [
    'Helpers/Razor/HtmlExtensions/Nl2brExtension.cs',
    'Helpers/Razor/HtmlClasses.cs',
    'Helpers/Razor/HtmlHelpers.cs',
    'Helpers/Razor/TemplatesConsts.cs',
    'Helpers/FlashMessage.cs',

    'Areas/Shared/Views/Partial/DisplayTemplates/Boolean.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/Currency.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/Date.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/DateTime.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/Decimal.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/DisplayBase.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/EmailAddress.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/Int32.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/MultilineText.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/Number.cshtml',
    'Areas/Shared/Views/Partial/DisplayTemplates/String.cshtml',

    'Areas/Shared/Views/Partial/EditorTemplates/_Label.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Boolean.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Currency.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Date.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/DateTime.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Decimal.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/DropDown.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/EmailAddress.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Enum.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/HttpPostedFileBase.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Int32.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/MultilineText.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Password.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Single.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/String.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/Text.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/TextBoxBase.cshtml',
    'Areas/Shared/Views/Partial/EditorTemplates/TimeSpan.cshtml',
    'Areas/Shared/Views/Partial/_FlashMessages.cshtml'
]
content_dir = 'content/'
generic_namespace = '$rootnamespace$'

# Copy files
parser = argparse.ArgumentParser(description='Resources extracter')
parser.add_argument('--solution', required=True)
parser.add_argument('--namespace', required=True)
args = parser.parse_args()

solution_path = args.solution
if not os.path.isdir(solution_path):
    print('Could not find solution directory {}'.format(solution_path))
    sys.exit(1)

# Find files in solution
print('Extracting files from solution...')
for file_path in files:
    # Copy file to this directory
    src_path = os.path.join(solution_path, file_path)
    dest_path = os.path.join(content_dir, file_path) + '.pp'

    if not os.path.isfile(src_path):
        print('Could not find resource {}'.format(src_path))
        sys.exit(1)

    # Create directories if necessary
    os.makedirs(os.path.dirname(dest_path), exist_ok=True)

    # Copy
    shutil.copyfile(src_path, dest_path)
    print('  - {}'.format(file_path))

    # Update namespace
    lines = []
    with open(dest_path, 'r') as fh:
        for line in fh:
            if args.namespace in line:
                line = line.replace(args.namespace, generic_namespace)

            lines.append(line)

    with open(dest_path, 'w') as fh:
        for line in lines:
            fh.write(line)
