#!/usr/bin/env bash
ORB_STR_APPLICATION_NAME=$(circleci env subst "${ORB_STR_APPLICATION_NAME}")
ORB_STR_PLATFORM_VERSION=$(circleci env subst "${ORB_STR_PLATFORM_VERSION}")
ORB_STR_ENVIRONMENT_NAME=$(circleci env subst "${ORB_STR_ENVIRONMENT_NAME}")
ORB_STR_LABEL=$(circleci env subst "${ORB_STR_LABEL}")
ORB_STR_DESCRIPTION=$(circleci env subst "${ORB_STR_DESCRIPTION}")
ORB_STR_PROFILE_NAME=$(circleci env subst "${ORB_STR_PROFILE_NAME}")

if [ -z "${ORB_STR_LABEL}" ]; then
    set -- "$@" -l "${ORB_STR_LABEL}"
fi

if [ -z "${ORB_STR_DESCRIPTION}" ]; then
    set -- "$@" -m "${ORB_STR_DESCRIPTION}"
fi

set -x
eb init "${ORB_STR_APPLICATION_NAME}" -r "${AWS_DEFAULT_REGION}" -p "${ORB_STR_PLATFORM_VERSION}" --profile "${ORB_STR_PROFILE_NAME}"
eb deploy "${ORB_STR_ENVIRONMENT_NAME}" "$@"
set +x
