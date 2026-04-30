# Release reminder

1. Bump `@version` in `mix.exs`.
2. Bump `version` in `native/tzf_ex/Cargo.toml` if the native crate version should match.
3. Run local checks:

   ```bash
   cargo test
   RUSTLER_BUILD=1 mix test
   ```

4. Commit with jj:

   ```bash
   jj describe -m "Release 0.1.1"
   jj new
   ```

5. Push the branch/change to GitHub.
6. Create and push a tag that exactly matches `@version`, for example `0.1.1`.

   The release asset URL uses:

   ```text
   https://github.com/sysashi/tzf_ex/releases/download/#{version}
   ```

   Example: Use `0.1.1`, not `v0.1.1`, unless the URL logic changes.

7. Wait for GitHub Actions to attach the precompiled NIF archive to the GitHub release.
8. Update the checksum file from the GitHub release artifact:

   ```bash
   mix rustler_precompiled.download TzfEx --only-local --no-config
   ```

   `--no-config` avoids compiling `lib/tzf_ex.ex` before the checksum file knows about the new archive.

9. Verify the normal precompiled path:

   ```bash
   mix test
   ```

10. Publish to Hex if consumers depend on the Hex package:

   ```bash
   mix hex.publish
   ```
