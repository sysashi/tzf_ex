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
