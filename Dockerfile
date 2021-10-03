FROM ubuntu:latest

ARG NEW_USER=cloud_user
ARG NEW_GROUP=cloud_user

# Setup SSHD
RUN apt update
RUN apt install -y sudo
# RUN apt install -y openssh-server
# RUN sed -i "s/PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
# RUN sed -i "s@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g" /etc/pam.d/sshd
# RUN mkdir /var/run/sshd

# Create User
RUN groupadd -r ${NEW_USER}
RUN useradd \
    --no-log-init \
    --create-home \
    --system \
    -u 1000 \
    -p toto \
    -g ${NEW_GROUP} \
    ${NEW_USER}

# Add user to sudoers
RUN sed -i /etc/sudoers -re 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD: ALL/g'
RUN sed -i /etc/sudoers -re 's/^root.*/root ALL=(ALL:ALL) NOPASSWD: ALL/g'
RUN sed -i /etc/sudoers -re 's/^#includedir.*/## **Removed the include directive** ##"/g'
RUN echo "${NEW_USER} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN gpasswd --add cloud_user sudo

EXPOSE 22

USER ${NEW_USER}

ARG HOME=/home/${NEW_USER}

COPY install.sh ${HOME}/install.sh
RUN bash ${HOME}/install.sh
RUN source ${HOME}/.asdf/asdf.sh && \
    asdf install ansible-base latest && \
    asdf global ansible-base latest

# CMD ["/usr/sbin/sshd", "-D"]
