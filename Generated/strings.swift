// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
internal enum L10n {

  internal enum Info {
    internal enum About {
      /// Covidcheck is made by Julian Schiavo and open sourced on Github under the Unlicense license.
      internal static let description = L10n.tr("Localizable", "info.about.description")
      /// ABOUT
      internal static let title = L10n.tr("Localizable", "info.about.title")
    }
    internal enum SymbolDescription {
      /// Decrease in current cases since last app open
      internal static let decreaseInCurrentCasesSinceLastAppOpen = L10n.tr("Localizable", "info.symbolDescription.decreaseInCurrentCasesSinceLastAppOpen")
      /// Increase in current cases since last app open
      internal static let increaseInCurrentCasesSinceLastAppOpen = L10n.tr("Localizable", "info.symbolDescription.increaseInCurrentCasesSinceLastAppOpen")
      /// Number of current cases (infected and not dead or recovered)
      internal static let numberOfCurrentCases = L10n.tr("Localizable", "info.symbolDescription.numberOfCurrentCases")
      /// Number of deaths from COVID-19
      internal static let numberOfDeathsFromCOVID19 = L10n.tr("Localizable", "info.symbolDescription.numberOfDeathsFromCOVID19")
      /// Number of people infected
      internal static let numberOfPeopleInfected = L10n.tr("Localizable", "info.symbolDescription.numberOfPeopleInfected")
      /// Number of recovered cases
      internal static let numberOfRecoveredCases = L10n.tr("Localizable", "info.symbolDescription.numberOfRecoveredCases")
      /// WHAT THE SYMBOLS MEAN
      internal static let title = L10n.tr("Localizable", "info.symbolDescription.title")
    }
  }

  internal enum Message {
    /// All Regions Collapsed
    internal static let allRegionsCollapsed = L10n.tr("Localizable", "message.allRegionsCollapsed")
    /// All Regions Expanded
    internal static let allRegionsExpanded = L10n.tr("Localizable", "message.allRegionsExpanded")
    /// Data Refreshed
    internal static let dataRefreshed = L10n.tr("Localizable", "message.dataRefreshed")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
