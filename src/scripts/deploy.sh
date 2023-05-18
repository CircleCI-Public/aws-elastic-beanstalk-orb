#!/usr/bin/env bash
ORB_EVAL_APPLICATION_NAME=$(circleci env subst "${ORB_EVAL_APPLICATION_NAME}")
ORB_EVAL_PLATFORM_VERSION=$(circleci env subst "${ORB_EVAL_PLATFORM_VERSION}")

if [ -z "${ORB_VAL_LABEL}" ]; then
    set -- "$@" -l "${ORB_VAL_LABEL}"
fi

if [ -z "${ORB_VAL_DESCRIPTION}" ]; then
    set -- "$@" -m "${ORB_VAL_DESCRIPTION}"
fi

set -x
eb init "${ORB_EVAL_APPLICATION_NAME}" -r "${AWS_DEFAULT_REGION}" -p "${ORB_EVAL_PLATFORM_VERSION}" --profile "${ORB_VAL_PROFILE}"
eb deploy "${ORB_VAL_ENVIRONMENT_NAME}" "$@"
set +x
