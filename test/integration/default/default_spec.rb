require 'pathname'

# FreeBSD 10+ uses clang
compilers = %w(gcc g++ cc c++)

compilers.each do |compiler|
  describe command("#{compiler} --version") do
    its(:exit_status) { should eq 0 }
    its(:stderr) { should eq '' }
  end
end

# On FreeBSD `make` is actually BSD make
gmake_bin = 'make'

# Ensure GNU Make exists
describe command("#{gmake_bin} --version") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/GNU/) }
end
