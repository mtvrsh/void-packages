#
# This helper is for building rust projects which use cargo for building
#

do_build() {
	: ${make_cmd:=cargo auditable}

	${make_cmd} build --release --locked --target ${RUST_TARGET} ${configure_args}
}

do_check() {
	: ${make_cmd:=cargo auditable}

	${make_check_pre} ${make_cmd} test --locked --target ${RUST_TARGET} \
		${configure_args} ${make_check_args}
}

do_install() {
	for f in target/${RUST_TARGET}/release*/*; do
		if [ -f "$f" ] && [ -x "$f" ]; then
			vbin "$f"
		fi
	done
}
