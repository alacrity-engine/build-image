FROM golang:1.21.1-alpine3.18 AS builder
RUN go install github.com/alacrity-engine/constr-gen@latest && \
    go install github.com/alacrity-engine/anim-packer@latest && \
    go install github.com/alacrity-engine/ss-packer@latest && \
    go install github.com/alacrity-engine/scene-packer@latest && \
    go install github.com/alacrity-engine/texture-packer@latest && \
    go install github.com/alacrity-engine/pic-packer@latest && \
    go install github.com/alacrity-engine/bin-packer@latest

FROM alpine:3.18
COPY --from=builder /go/bin/ /go/bin/
RUN export PATH="$PATH:/go/bin"