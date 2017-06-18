defmodule Exbot.Mixfile do
  use Mix.Project

  def project do
    [app: :exbot,
      version: "0.1.2",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps(),
			package: package(),
      name: "Exbot",
    	description: "Telegram API",
      source_url: "https://github.com/yeospace/exbot",]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [applications: [:httpoison, :poison]]
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:httpoison, "~> 0.9"},
     {:poison, "~> 3.0"},
		 {:ex_doc, ">= 0.0.0", only: :dev},]
  end

	defp package do
    # These are the default files included in the package
    %{
      files: ["lib", "mix.exs", "README*",],
      maintainers: ["Vinh Nguyen"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/yeospace/exbot"}
    }
  end
end
