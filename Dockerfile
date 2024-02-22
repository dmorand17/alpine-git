FROM alpine

RUN apk fix && \
  apk --no-cache --update add git git-lfs gpg less openssh patch \
  && git lfs install \
  # Add safe directory to system /etc/gitconfig to avoid dubious ownership
  && git config --system --add safe.directory "*" \
  && adduser -D -u 1000 git-user \
  && mkdir /git \
  && chown -R 1000:1000 /git

USER 1000

RUN mkdir ~/.ssh && chmod 0700 ~/.ssh \
  && ssh-keyscan github.com > ~/.ssh/known_hosts

VOLUME /git
WORKDIR /git

# These can be enabled to allow for testing via the shell
# ENTRYPOINT [ "sh", "-c" ]
# CMD ["git"]

ENTRYPOINT ["git"]
CMD ["--help"]
