defmodule Issues.CLI do
  @default_count 4

  def run(argv) do
    argv
    |> parse_args
    |> process
  end

  def parse_args(argv) do
    OptionParser.parse(argv, switches: [ help: :boolean],
                  aliases: [ h: :help ])
    |> elem(1)
    |> parse_output
  end

  defp parse_output([user, project, count]) do
    { user, project, String.to_integer(count) }
  end

  defp parse_output([user, project]) do
    { user, project, @default_count }
  end

  defp parse_output(_) do
    :help
  end

  def process(:help) do
    IO.puts """
      usage: issues <user> <project> [ count | #{@default_count} ]
    """
    System.halt(0)
  end

  def process({_user, _project, _count}) do
    # Issues.GithubIssues.fetch(user, project)
    1
  end
end
