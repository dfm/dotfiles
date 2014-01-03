//
// Compile with:
// cc -o mutt-contact-complete complete.m -framework Foundation -framework AddressBook
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

int main(int argc, char *argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];

    // Parse the input arguments.
    NSUserDefaults *args = [NSUserDefaults standardUserDefaults];
    NSString *q = [args stringForKey: @"q"];
    if (q == nil) {
        printf("Usage:\n    mutt-contact-complete -q PREFIX\n");
        [pool release];
        return 1;
    }

    ABAddressBook *ab = [ABAddressBook sharedAddressBook];

    // Build the prefix search on the emails and names.
    ABSearchElement *emailSearch =
        [ABPerson searchElementForProperty: kABEmailProperty
                                     label: nil
                                       key: nil
                                     value: q
                                comparison: kABPrefixMatchCaseInsensitive];
    ABSearchElement *firstNameSearch =
        [ABPerson searchElementForProperty: kABFirstNameProperty
                                     label: nil
                                       key: nil
                                     value: q
                                comparison: kABPrefixMatchCaseInsensitive];
    ABSearchElement *lastNameSearch =
        [ABPerson searchElementForProperty: kABLastNameProperty
                                     label: nil
                                       key: nil
                                     value: q
                                comparison: kABPrefixMatchCaseInsensitive];

    // Combine the queries using "or".
    ABSearchElement *query =
        [ABSearchElement searchElementForConjunction: kABSearchOr
                                            children: [NSArray arrayWithObjects: emailSearch, firstNameSearch, lastNameSearch, nil]];

    // Run the query.
    NSArray *people = [ab recordsMatchingSearchElement: query];

    // Output the results.
    for (ABPerson *person in people) {
        NSString *fn = [person valueForProperty: kABFirstNameProperty];
        NSString *ln = [person valueForProperty: kABLastNameProperty];
        ABMultiValue *emails = [person valueForProperty: kABEmailProperty];
        int i, count = [emails count];
        for (i = 0; i < count; ++i) {
            printf("%s\t%s %s\n", [[emails valueAtIndex: i] UTF8String],
                   [fn UTF8String], [ln UTF8String]);
        }
    }

    [pool release];
    return 0;
}
